const express = require("express");
const app = express();
const PORT = 3000;

const APP_VERSION = "2.1.0";

app.get("/", (req, res) => {
  res.send(`
    <!DOCTYPE html>
    <html>
    <head>
      <title>Globomantics - Pipeline Demo</title>
      <style>
        body { font-family: Arial, sans-serif; display: flex; justify-content: center; align-items: center; min-height: 100vh; margin: 0; background: #f0f4f8; }
        .card { background: white; border-radius: 12px; padding: 40px 60px; box-shadow: 0 4px 20px rgba(0,0,0,0.1); text-align: center; }
        h1 { color: #1a365d; margin-bottom: 8px; }
        .version { color: #718096; font-size: 14px; }
        .status { color: #38a169; font-weight: bold; margin-top: 16px; }
      </style>
    </head>
    <body>
      <div class="card">
        <h1>Globomantics CI/CD</h1>
        <p class="version">Version ${APP_VERSION}</p>
        <p class="status">Deployed through CodePipeline</p>
      </div>
    </body>
    </html>
  `);
});

app.get("/health", (req, res) => {
  res.json({ status: "healthy", version: APP_VERSION, module: "m2" });
});

app.listen(PORT, () => {
  console.log(`Globomantics app v${APP_VERSION} running on port ${PORT}`);
});
