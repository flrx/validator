module.exports = {
    title: "Flrx Validator",
    description: "Validator on Steroids",
    base: "/validator/",
    themeConfig: {
        displayAllHeaders: true, // Default: false,
        sidebar: ["/", "/validator", "/rule"],
        algolia: {
            apiKey: '1cc6df72a7d648335129bdef99facc02',
            indexName: 'flrx_validator'
        },
        nav: [
            {
                text: "Changelog",
                link: "https://github.com/flrx/validator/blob/master/CHANGELOG.md"
            },
            {
                text: "API Docs",
                link: "https://pub.dev/documentation/flrx_validator/latest/"
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
