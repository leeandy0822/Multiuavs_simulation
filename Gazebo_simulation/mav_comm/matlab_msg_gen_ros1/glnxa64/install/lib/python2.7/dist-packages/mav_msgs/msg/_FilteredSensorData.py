# This Python file uses the following encoding: utf-8
"""autogenerated by genpy from mav_msgs/FilteredSensorData.msg. Do not edit."""
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct

import geometry_msgs.msg
import std_msgs.msg

class FilteredSensorData(genpy.Message):
  _md5sum = "a9b51fae1f4ed3a8a0522b4ffe61659f"
  _type = "mav_msgs/FilteredSensorData"
  _has_header = True #flag to mark the presence of a Header object
  _full_text = """Header header

geometry_msgs/Vector3 accelerometer	# acceleration in vehicle frame [m/s^2]
geometry_msgs/Vector3 gyroscope     # rotational velocity in vehicle frame [rad/s]
geometry_msgs/Vector3 magnetometer  # Magnetometer measurements in vehicle frame [uT]
float64 barometer                   # Height from barometer relative to start-up point [m]

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

================================================================================
MSG: geometry_msgs/Vector3
# This represents a vector in free space. 
# It is only meant to represent a direction. Therefore, it does not
# make sense to apply a translation to it (e.g., when applying a 
# generic rigid transformation to a Vector3, tf2 will only apply the
# rotation). If you want your data to be translatable too, use the
# geometry_msgs/Point message instead.

float64 x
float64 y
float64 z"""
  __slots__ = ['header','accelerometer','gyroscope','magnetometer','barometer']
  _slot_types = ['std_msgs/Header','geometry_msgs/Vector3','geometry_msgs/Vector3','geometry_msgs/Vector3','float64']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       header,accelerometer,gyroscope,magnetometer,barometer

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(FilteredSensorData, self).__init__(*args, **kwds)
      #message fields cannot be None, assign default values for those that are
      if self.header is None:
        self.header = std_msgs.msg.Header()
      if self.accelerometer is None:
        self.accelerometer = geometry_msgs.msg.Vector3()
      if self.gyroscope is None:
        self.gyroscope = geometry_msgs.msg.Vector3()
      if self.magnetometer is None:
        self.magnetometer = geometry_msgs.msg.Vector3()
      if self.barometer is None:
        self.barometer = 0.
    else:
      self.header = std_msgs.msg.Header()
      self.accelerometer = geometry_msgs.msg.Vector3()
      self.gyroscope = geometry_msgs.msg.Vector3()
      self.magnetometer = geometry_msgs.msg.Vector3()
      self.barometer = 0.

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
      _x = self
      buff.write(_get_struct_3I().pack(_x.header.seq, _x.header.stamp.secs, _x.header.stamp.nsecs))
      _x = self.header.frame_id
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.pack('<I%ss'%length, length, _x))
      _x = self
      buff.write(_get_struct_10d().pack(_x.accelerometer.x, _x.accelerometer.y, _x.accelerometer.z, _x.gyroscope.x, _x.gyroscope.y, _x.gyroscope.z, _x.magnetometer.x, _x.magnetometer.y, _x.magnetometer.z, _x.barometer))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize(self, str):
    """
    unpack serialized message in str into this message instance
    :param str: byte array of serialized message, ``str``
    """
    try:
      if self.header is None:
        self.header = std_msgs.msg.Header()
      if self.accelerometer is None:
        self.accelerometer = geometry_msgs.msg.Vector3()
      if self.gyroscope is None:
        self.gyroscope = geometry_msgs.msg.Vector3()
      if self.magnetometer is None:
        self.magnetometer = geometry_msgs.msg.Vector3()
      end = 0
      _x = self
      start = end
      end += 12
      (_x.header.seq, _x.header.stamp.secs, _x.header.stamp.nsecs,) = _get_struct_3I().unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.header.frame_id = str[start:end].decode('utf-8')
      else:
        self.header.frame_id = str[start:end]
      _x = self
      start = end
      end += 80
      (_x.accelerometer.x, _x.accelerometer.y, _x.accelerometer.z, _x.gyroscope.x, _x.gyroscope.y, _x.gyroscope.z, _x.magnetometer.x, _x.magnetometer.y, _x.magnetometer.z, _x.barometer,) = _get_struct_10d().unpack(str[start:end])
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e) #most likely buffer underfill


  def serialize_numpy(self, buff, numpy):
    """
    serialize message with numpy array types into buffer
    :param buff: buffer, ``StringIO``
    :param numpy: numpy python module
    """
    try:
      _x = self
      buff.write(_get_struct_3I().pack(_x.header.seq, _x.header.stamp.secs, _x.header.stamp.nsecs))
      _x = self.header.frame_id
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.pack('<I%ss'%length, length, _x))
      _x = self
      buff.write(_get_struct_10d().pack(_x.accelerometer.x, _x.accelerometer.y, _x.accelerometer.z, _x.gyroscope.x, _x.gyroscope.y, _x.gyroscope.z, _x.magnetometer.x, _x.magnetometer.y, _x.magnetometer.z, _x.barometer))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize_numpy(self, str, numpy):
    """
    unpack serialized message in str into this message instance using numpy for array types
    :param str: byte array of serialized message, ``str``
    :param numpy: numpy python module
    """
    try:
      if self.header is None:
        self.header = std_msgs.msg.Header()
      if self.accelerometer is None:
        self.accelerometer = geometry_msgs.msg.Vector3()
      if self.gyroscope is None:
        self.gyroscope = geometry_msgs.msg.Vector3()
      if self.magnetometer is None:
        self.magnetometer = geometry_msgs.msg.Vector3()
      end = 0
      _x = self
      start = end
      end += 12
      (_x.header.seq, _x.header.stamp.secs, _x.header.stamp.nsecs,) = _get_struct_3I().unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.header.frame_id = str[start:end].decode('utf-8')
      else:
        self.header.frame_id = str[start:end]
      _x = self
      start = end
      end += 80
      (_x.accelerometer.x, _x.accelerometer.y, _x.accelerometer.z, _x.gyroscope.x, _x.gyroscope.y, _x.gyroscope.z, _x.magnetometer.x, _x.magnetometer.y, _x.magnetometer.z, _x.barometer,) = _get_struct_10d().unpack(str[start:end])
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e) #most likely buffer underfill

_struct_I = genpy.struct_I
def _get_struct_I():
    global _struct_I
    return _struct_I
_struct_3I = None
def _get_struct_3I():
    global _struct_3I
    if _struct_3I is None:
        _struct_3I = struct.Struct("<3I")
    return _struct_3I
_struct_10d = None
def _get_struct_10d():
    global _struct_10d
    if _struct_10d is None:
        _struct_10d = struct.Struct("<10d")
    return _struct_10d
