module.exports = {
  title: "Flrx Validator",
  description: "Validator on Steroids",
  base: "/validator/",
  themeConfig: {
    displayAllHeaders: true, // Default: false,
    sidebar: ["/", "/validator", "/rule"],
    nav: [
      {
        text: "Changelog",
        link: "https://github.com/flrx/validator/blob/master/CHANGELOG.md"
      },
    ],
    /* Repository Config */
    repo: "flrx/validator",
    repoLabel: "Github",
    docsDir: "doc",
    docsBranch: "master",
    editLinks: true,
    editLinkText: "Help us improve this page!"
  },
};
