import 'dart:ffi'; // For FFI
import 'dart:io'; // For Platform.isX
import 'package:ffi/ffi.dart';

final DynamicLibrary _serialPortLib = Platform.isAndroid
    ? DynamicLibrary.open("libserial_port.so")
    : DynamicLibrary.process();

    final int Function(int x, int y) nativeAdd =
  _serialPortLib
    .lookup<NativeFunction<Int32 Function(Int32, Int32)>>("native_add")
    .asFunction();


    final int Function(int baudrateSpeed) selectBaudrate =   
    _serialPortLib
    .lookup<NativeFunction<Int32 Function(Int32)>>("selectBaudrate")
    .asFunction();


    final int Function(int dataBits) selectDataBits =   
    _serialPortLib
    .lookup<NativeFunction<Int32 Function(Int32)>>("selectDataBits")
    .asFunction();

bool  testSerialPort(String portName){
  final result_int = _testSerialPort(Utf8.toUtf8(portName));
  print(result_int);

  return false;
}
final int Function(Pointer<Utf8> portName) _testSerialPort =   
    _serialPortLib
    .lookup<NativeFunction<Int32 Function(Pointer<Utf8>)>>("testSerialPort")
    .asFunction();

    //bool testSerialPort(const char* port_name);