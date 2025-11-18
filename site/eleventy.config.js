import { glob } from 'node:fs/promises';
import path from 'path';

export default async function (eleventyConfig) {

	// Configure Eleventy

	// to just copy bundled files
	eleventyConfig.addPassthroughCopy({ '../ArtificialIntelligence/Tareas/Tarea-01/out/': '/ArtificialIntelligence/Tareas/Tarea-01/out/' });
	// to copy index.html from assignment
	eleventyConfig.addPassthroughCopy({ '../ArtificialIntelligence/Tareas/Tarea-01/index.html': '/ArtificialIntelligence/Tareas/Tarea-01/index.html' });

	// add my own collection, it implies return a list of objects
	eleventyConfig.addCollection("pdfs", async (collectionAPI) => {
		const pattern = "_site/pdfs/**/*.pdf";
		const files = [];
		try {
			for await (const file of glob(pattern)) {
				files.push(file);
			}
		} catch (error) {
			throw error;
		}

		const pdfs = files.map(f => {
			const sep = f.split(path.sep).slice(2); // remove _site, pdfs
			const newPath = path.join(...sep); // the path inside de pdfs folder

			return {
				title: path.basename(f, ".pdf"),
				course: sep[0],
				url: `./pdfs/${newPath}`,
			}
		});
		return pdfs;

		// return collectionAPI.getFilteredByGlob("_site/pdfs/*") doesn't work 
		// because according to the docs it will ignore the .pdf files because .pdf is not supported by 11ty
	});

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