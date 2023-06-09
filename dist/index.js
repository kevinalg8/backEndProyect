"use strict";

var _app = _interopRequireDefault(require("./app.js"));
var _config = require("./config");
function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { "default": obj }; }
_app["default"].listen(_app["default"].get("PORT"), _config.caseEntorno);