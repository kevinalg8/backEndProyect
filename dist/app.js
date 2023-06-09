"use strict";

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports["default"] = void 0;
var _express = _interopRequireDefault(require("express"));
var _message = _interopRequireDefault(require("./config/message"));
var _enviroment = _interopRequireDefault(require("./config/enviroment"));
var _products = _interopRequireDefault(require("./routes/products.routes"));
var _user = _interopRequireDefault(require("./routes/user.routes"));
function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { "default": obj }; }
var app = (0, _express["default"])();
app.set("PORT", process.env.PORT || 3000);
app.use(_express["default"].json());
app.use("/api", _products["default"]);
app.use("/apiUser", _user["default"]);
var _default = app;
exports["default"] = _default;