return {
  settings = {
    ltex = {
      enabled = { "latex", "tex", "markdown" },
      language = "en-US",
      diagnosticSeverity = "information",
      sentenceCacheSize = 2000,
      additionalRules = {
        enablePickyRules = true,
        motherTongue = "en-US",
      },
      trace = { server = "verbose" },
      dictionary = {},
      disabledRules = {},
      hiddenFalsePositives = {},
      latex = {
        commands = { "-auxdir=build", "-aux-directory=build" },
      },
    },
  },
}
-- → ltex.additionalRules.enablePickyRules    default: false
-- → ltex.additionalRules.languageModel       default: ""
-- → ltex.additionalRules.motherTongue        default: ""
-- → ltex.additionalRules.neuralNetworkModel  default: ""
-- → ltex.additionalRules.word2VecModel       default: ""
-- → ltex.bibtex.fields                       default: {}
-- → ltex.checkFrequency                      default: "edit"
-- → ltex.clearDiagnosticsWhenClosingFile     default: true
-- → ltex.completionEnabled                   default: false
-- → ltex.configurationTarget
-- → ltex.dictionary
-- → ltex.disabledRules
-- → ltex.enabledRules
-- → ltex.hiddenFalsePositives
-- → ltex.java.initialHeapSize                default: 64
-- → ltex.java.maximumHeapSize                default: 512
-- → ltex.java.path                           default: ""
-- → ltex.language                            default: "en-US"
-- → ltex.languageToolHttpServerUri           default: ""
-- → ltex.languageToolOrg.apiKey              default: ""
-- → ltex.languageToolOrg.username            default: ""
-- → ltex.latex.commands                      default: {}
-- → ltex.latex.environments                  default: {}
-- → ltex.ltex-ls.languageToolHttpServerUri   default: ""
-- → ltex.ltex-ls.languageToolOrgApiKey       default: ""
-- → ltex.ltex-ls.languageToolOrgUsername     default: ""
-- → ltex.ltex-ls.logLevel                    default: "fine"
-- → ltex.ltex-ls.path                        default: ""
-- → ltex.markdown.nodes                      default: {}
-- → ltex.statusBarItem                       default: false
