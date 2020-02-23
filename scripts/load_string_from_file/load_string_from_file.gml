/// @desc load_string_from_file
/// @arg filename

var _filename = argument[0];

var _buffer = buffer_load(_filename);

var _string = buffer_read(_buffer, buffer_string);
buffer_delete(_buffer);

var _decoded = base64_decode(_string);

return _decoded;
