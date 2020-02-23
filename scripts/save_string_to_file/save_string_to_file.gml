/// @desc save_string_to_file
/// @arg filename
/// @arg string

var _filename = argument[0];
var _string = argument[1];

var _encoded = base64_encode(_string);

var _buffer = buffer_create(string_byte_length(_encoded) + 1, buffer_fixed, 1);

buffer_write(_buffer, buffer_string, _encoded);

buffer_save(_buffer, _filename);

buffer_delete(_buffer);