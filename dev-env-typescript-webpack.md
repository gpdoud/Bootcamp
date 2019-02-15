# TypeScript Development Environment

1. npm init -y
2. npm install typescript ts-loader webpack webpack-dev-server webpack-cli --save-dev
3. package.json
```
{
  "name": "webpack-test",
  "version": "1.0.0",
  "description": "",
  "private": true,
  "scripts": {
    "build": "webpack",
    "start": "webpack-dev-server --mode development",
    "test": "echo \"Error: no test specified\" && exit 1"
  },
  "keywords": [],
  "author": "",
  "license": "ISC",
  "devDependencies": {
    "ts-loader": "^4.4.2",
    "typescript": "^2.9.2",
    "webpack": "^4.16.3",
    "webpack-cli": "^3.1.0",
    "webpack-dev-server": "^3.1.5"
  }
}
```
4. tsconfig.json
```
{
  "compilerOptions": {
    "outDir": "./dist/",
    "sourceMap": true,
    "noImplicitAny": true,
    "module": "es6",
    "target": "es5",
    "jsx": "react",
    "allowJs": true
  }
}
```
5. webpack.config.js
```
const path = require('path');

module.exports = {
  entry: './src/main.ts',
  devtool: 'inline-source-map',
  devServer: {
    contentBase: './dist'
  },
  module: {
    rules: [
      {
        test: /\.tsx?$/,
        use: 'ts-loader',
        exclude: /node_modules/
      }
    ]
  },
  resolve: {
    extensions: [ '.tsx', '.ts', '.js' ]
  },
  output: {
    filename: 'bundle.js',
    path: path.resolve(__dirname, 'dist')
  }
};
```
6. ./src/main.ts
```
export class HW {
  static createH1() {
    let h1 = document.createElement("h1");
    h1.innerText = "Hello, world Typescript";
    return h1;
  }
}
document.body.appendChild(HW.createH1());
```
7. ./dist/index.html
```
<!DOCTYPE html>
<html>
<head>
  <title></title>
</head>
<body>
  <script src="bundle.js"></script>
</body>
</html>
```