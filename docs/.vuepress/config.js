module.exports = {
  title: "Flrx Validator",
  description: "Validator on Steroids",
  base: "/validator/",
  themeConfig: {
    sidebar: ["/", "/validator", "/rule"],
    nav: [
      {
        text: "Changelog",
        link: "https://github.com/flrx/validator/blob/master/CHANGELOG.md"
      },
      { text: "Github", link: "https://github.com/flrx/validator" }
    ]
  },
  repo: "flrx/validator",
  repoLabel: "Contribute!",
  docsRepo: "vuejs/vuepress",
  docsDir: "docs",
  docsBranch: "master",
  editLinks: true,
  editLinkText: "Help us improve this page!"
};
