module.exports = {
  defaultBrowser: { name: "Arc" },
  options: {
        hideIcon: true,
        logRequests: false,
  },
  handlers: [
    {
      match: ({url}) => {
        console.log(`URL to handle: ${url.host}`);
        return url.host.startsWith("vpn-") && url.host.endsWith("bol.com")
      },
      browser: { name: "Safari" }
    },
  ]
};
