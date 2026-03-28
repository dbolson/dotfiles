return {
	capabilities = {
		workspace = {
			didChangeWatchedFiles = {
				dynamicRegistration = true,
			},
		},
	},
	init_options = {
		maxTsServerMemory = 8192,
	},
	-- inlayHints = {
	-- 	parameterNames = {
	-- 		enabled = "all", -- "none" | "literals" | "all"
	-- 		suppressWhenArgumentMatchesName = false,
	-- 	},
	-- 	parameterTypes = {
	-- 		enabled = true,
	-- 	},
	-- 	variableTypes = {
	-- 		enabled = true,
	-- 		suppressWhenTypeMatchesName = false,
	-- 	},
	-- 	propertyDeclarationTypes = {
	-- 		enabled = true,
	-- 	},
	-- 	functionLikeReturnTypes = {
	-- 		enabled = true,
	-- 	},
	-- 	enumMemberValues = {
	-- 		enabled = true,
	-- 	},
	-- },
	-- implementationsCodeLens = {
	-- 	enabled = true,
	-- 	showOnInterfaceMethods = true,
	-- 	showOnAllClassMethods = true,
	-- },
	-- referencesCodeLens = {
	-- 	enabled = true,
	-- 	showOnAllFunctions = true,
	-- },
	-- organizeImports = {
	-- 	typeOrder = "last", -- "auto" | "last" | "first" | "inline"
	-- 	caseSensitivity = "auto", -- "auto" | "caseInsensitive" | "caseSensitive"
	-- },

	-- suggest = {
	-- 	autoImports = true,
	-- 	includeAutomaticOptionalChainCompletions = true,
	-- 	includeCompletionsForImportStatements = true,
	-- 	classMemberSnippets = { enabled = true },
	-- 	objectLiteralMethodSnippets = { enabled = true },
	-- },
}
