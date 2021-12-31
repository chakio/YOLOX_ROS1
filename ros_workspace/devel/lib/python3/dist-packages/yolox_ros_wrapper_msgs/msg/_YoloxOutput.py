# This Python file uses the following encoding: utf-8
"""autogenerated by genpy from yolox_ros_wrapper_msgs/YoloxOutput.msg. Do not edit."""
import codecs
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct

import yolox_ros_wrapper_msgs.msg

class YoloxOutput(genpy.Message):
  _md5sum = "b9b9a86cebc49e7b022259f40e43d47d"
  _type = "yolox_ros_wrapper_msgs/YoloxOutput"
  _has_header = False  # flag to mark the presence of a Header object
  _full_text = """yolox_ros_wrapper_msgs/YoloxDetectedObject[] detected_objects
================================================================================
MSG: yolox_ros_wrapper_msgs/YoloxDetectedObject
string                                              class_name
int32                                               class_id
float32                                             score
int32                                               x0
int32                                               x1
int32                                               y0
int32                                               y1
int32                                               image_width
int32                                               image_height"""
  __slots__ = ['detected_objects']
  _slot_types = ['yolox_ros_wrapper_msgs/YoloxDetectedObject[]']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       detected_objects

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(YoloxOutput, self).__init__(*args, **kwds)
      # message fields cannot be None, assign default values for those that are
      if self.detected_objects is None:
        self.detected_objects = []
    else:
      self.detected_objects = []

  def _get_types(self):
    """
    internal API method
    """
    return self._slot_types

  def serialize(self, buff):
    """
    serialize message into buffer
    :param buff: buffer, ``StringIO``
    """
    try:
      length = len(self.detected_objects)
      buff.write(_struct_I.pack(length))
      for val1 in self.detected_objects:
        _x = val1.class_name
        length = len(_x)
        if python3 or type(_x) == unicode:
          _x = _x.encode('utf-8')
          length = len(_x)
        buff.write(struct.Struct('<I%ss'%length).pack(length, _x))
        _x = val1
        buff.write(_get_struct_if6i().pack(_x.class_id, _x.score, _x.x0, _x.x1, _x.y0, _x.y1, _x.image_width, _x.image_height))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize(self, str):
    """
    unpack serialized message in str into this message instance
    :param str: byte array of serialized message, ``str``
    """
    if python3:
      codecs.lookup_error("rosmsg").msg_type = self._type
    try:
      if self.detected_objects is None:
        self.detected_objects = None
      end = 0
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      self.detected_objects = []
      for i in range(0, length):
        val1 = yolox_ros_wrapper_msgs.msg.YoloxDetectedObject()
        start = end
        end += 4
        (length,) = _struct_I.unpack(str[start:end])
        start = end
        end += length
        if python3:
          val1.class_name = str[start:end].decode('utf-8', 'rosmsg')
        else:
          val1.class_name = str[start:end]
        _x = val1
        start = end
        end += 32
        (_x.class_id, _x.score, _x.x0, _x.x1, _x.y0, _x.y1, _x.image_width, _x.image_height,) = _get_struct_if6i().unpack(str[start:end])
        self.detected_objects.append(val1)
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e)  # most likely buffer underfill


  def serialize_numpy(self, buff, numpy):
    """
    serialize message with numpy array types into buffer
    :param buff: buffer, ``StringIO``
    :param numpy: numpy python module
    """
    try:
      length = len(self.detected_objects)
      buff.write(_struct_I.pack(length))
      for val1 in self.detected_objects:
        _x = val1.class_name
        length = len(_x)
        if python3 or type(_x) == unicode:
          _x = _x.encode('utf-8')
          length = len(_x)
        buff.write(struct.Struct('<I%ss'%length).pack(length, _x))
        _x = val1
        buff.write(_get_struct_if6i().pack(_x.class_id, _x.score, _x.x0, _x.x1, _x.y0, _x.y1, _x.image_width, _x.image_height))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize_numpy(self, str, numpy):
    """
    unpack serialized message in str into this message instance using numpy for array types
    :param str: byte array of serialized message, ``str``
    :param numpy: numpy python module
    """
    if python3:
      codecs.lookup_error("rosmsg").msg_type = self._type
    try:
      if self.detected_objects is None:
        self.detected_objects = None
      end = 0
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      self.detected_objects = []
      for i in range(0, length):
        val1 = yolox_ros_wrapper_msgs.msg.YoloxDetectedObject()
        start = end
        end += 4
        (length,) = _struct_I.unpack(str[start:end])
        start = end
        end += length
        if python3:
          val1.class_name = str[start:end].decode('utf-8', 'rosmsg')
        else:
          val1.class_name = str[start:end]
        _x = val1
        start = end
        end += 32
        (_x.class_id, _x.score, _x.x0, _x.x1, _x.y0, _x.y1, _x.image_width, _x.image_height,) = _get_struct_if6i().unpack(str[start:end])
        self.detected_objects.append(val1)
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e)  # most likely buffer underfill

_struct_I = genpy.struct_I
def _get_struct_I():
    global _struct_I
    return _struct_I
_struct_if6i = None
def _get_struct_if6i():
    global _struct_if6i
    if _struct_if6i is None:
        _struct_if6i = struct.Struct("<if6i")
    return _struct_if6i
