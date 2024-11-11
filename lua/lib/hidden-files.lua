local HIDDEN_FILES = {
   "node_modules",
   "dist",
   ".dist",
   ".next",
   ".git",
   "package-lock.json",
   ".swc",
   "coverage",
   "diagrams",
   "target",
   "build",
   "out",
   ".settings"
}

local HIDDEN_FILES_BY_PATTERN = {
   "*.meta",
   "*/.git"
}

return {
   HIDDEN_FILES = HIDDEN_FILES,
   HIDDEN_FILES_BY_PATTERN = HIDDEN_FILES_BY_PATTERN
}
