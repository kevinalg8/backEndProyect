"use strict";

var _path = _interopRequireDefault(require("path"));
var _dotenv = _interopRequireDefault(require("dotenv"));
function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { "default": obj }; }
_dotenv["default"].config({
  "path": _path["default"].join(_path["default"].resolve(__dirname, "".concat(process.env.NODE_ENV, ".env")))
});