
export default async function(eleventyConfig) {
	
	// Configure Eleventy

	// to get a live server on my root directory
	eleventyConfig.setInputDirectory("..");

	// to just copy bundled files
    eleventyConfig.addPassthroughCopy('../ArtificialIntelligence/Tareas/Tarea-01/out/');

    // eleventyConfig.addTemplateFormats("js");
    // eleventyConfig.addWatchTarget("./ArtificialIntelligence/Tareas/Tarea-01/dist/");

	// "clowd" here means that the extension will apply to any .clowd file
	// eleventyConfig.addExtension("js", {
	// 	compile: async (inputContent) => {
			
	// 		return async () => {
	// 			return inputContent;
	// 		};
	// 	},
	// });
};