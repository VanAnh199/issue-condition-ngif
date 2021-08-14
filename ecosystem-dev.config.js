module.exports = {
  apps: [
    {
      name: "gso-webapp",
      script: "./server/index.js",
      ignore_watch: ["node_modules"],
      instances: 1,
      autorestart: true,
      env: {
        NODE_ENV: "dev",
      },
    },
  ],
};
