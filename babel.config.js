module.exports = {
  presets: [
    [
      "@babel/preset-env",
      {
        targets: {
          node: "current",
        },
      },
    ],
    ["@babel/preset-typescript", { onlyRemoveTypeImports: true }],
  ],
  plugins: [
    ["@babel/plugin-proposal-decorators", { version: "legacy" }],
    ["@babel/plugin-proposal-class-properties", { loose: true }],
    ["babel-plugin-parameter-decorator"],
    ["@babel/plugin-transform-flow-strip-types"],
    ["@babel/plugin-proposal-class-static-block"],
    [
      "module-resolver",
      {
        alias: {
          "@modules": "./src/modules",
          "@core": "./src/core",
          "@shared": "./src/shared",
          "@infra": "./src/infra",
          "@config": "./src/config",
          "@generated": "./src/prisma/generated/type-graphql",
        },
      },
    ],
  ],
  ignore: ["**/*.spec.ts"],
};
