const std = @import("std");
const expect = std.testing.expect;

//const MSGPanicHandler = fn (msg: []const u8, file: []const u8, line: u32) void {
//    std.debug.print("Triple fault or panic occurred!\n Message: {}\n File: {}\n Line: {}\n", .{ msg, file, line });
//    std.os.exit(1);
//};

const FileOpenError = error{
    AccessDenied,
    OutOfMemory,
    FileNotFound,
};

const AllocationError = error{OutOfMemory};

fn allocFail() AllocationError {
    return error.OutOfMemory;
}
test "coerce error from a subset to a superset" {
    const err: FileOpenError = allocFail();
    try expect(err == FileOpenError.OutOfMemory);
}

//Helpers
const measured_unit = struct {
    value: f32,
    unit_type: []const u8
};

pub fn mili(data: f32) f32 {
    return data/1000.0;
}
pub fn micro(data: f32) f32 {
    return mili(data)/1000.0;
}
pub fn nano(data: f32) f32 {
    return micro(data)/1000.0;
}
pub fn pico(data: f32) f32 {
    return nano(data)/1000.0;
}

fn Vector(comptime T: type, comptime N: usize) type {
    return struct {
        data: [N]T,
    };
}
//Example: const Vec3f = Vector(f32, 3);


//Hőtágulás: l = l0 * alpha * delta_T
//Params:
//l0: Length (m)
//alpha: Linear thermal expansion constant (1/Kelvin)
//delta_T: Kelvin
pub fn calc_thermal_expansion(l0: f32, alpha: f32, delta_T: f32) f32 {
    const l_result: f32 = l0 * alpha * delta_T;
    return l_result;
}
pub fn C_calc_thermal_expansion(comptime l0: f32, comptime alpha: f32, comptime delta_T: f32) f32 {
    const l_result: f32 = l0 * alpha * delta_T;
    return l_result;
}

//Hőátadás: P=Iq=(lambda/d) *A*delta_T
//Params:
//d = rétegvastagság
//lambda = hővezetési tényező
//A = felület
//delta_T = hőkülönbség
//P = hőteljesítmény
pub fn calc_thermal_potency(lambda: f32, d: f32, A: f32, delta_T: f32) f32 {
    const P_result: f32 = lambda * A * delta_T / d;
    return P_result;
}
pub fn C_calc_thermal_potency(comptime lambda: f32, comptime d: f32, comptime A: f32, comptime delta_T: f32) f32 {
    const P_result: f32 = lambda * A * delta_T / d;
    return P_result;
}
//Planetary force: F=G*m1*m2/r^2
const G: f32= 6.6743*0.00000000001;//6.6743 × 10^-11 m^3 kg^-1 s^-2
const k: f32= 9*1000000000;
pub fn calc_gravitational_force(m1: f32, m2: f32, r: f32) f32 {
    const g_result: f32 = G*m1*m2/(r*r);
    return g_result;
}
pub fn C_calc_gravitational_force(comptime m1: f32, comptime m2: f32, comptime r: f32) f32 {
    const g_result: f32 = G*m1*m2/(r*r);
    return g_result;
}
pub fn calc_e_gravitational_force(q1: f32, q2: f32, r: f32) f32 {
    const g_result: f32 = k*q1*q2/(r*r);
    return g_result;
}
pub fn C_calc_e_gravitational_force(comptime q1: f32, comptime q2: f32, comptime r: f32) f32 {
    const e_result: f32 = k*q1*q2/(r*r);
    return e_result;
}


pub fn printf(valmeasured: measured_unit) void {
    std.debug.print("{d} {s}\n", .{ valmeasured.value, valmeasured.unit_type });
}

pub fn main() !void {
    //std.debug.setPanicHandler(MSGPanicHandler);
    
    //l0= 0.3 m
    //alpha= 0.01 1/K
    //delta_T= 23 K°
    
    const result1 = measured_unit{.value =calc_thermal_expansion(0.3 , 0.01 , 23 ), .unit_type="m"};
    printf(result1);
    
    
}