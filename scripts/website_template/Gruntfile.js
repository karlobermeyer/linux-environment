/* For automatically generating images of various sizes. After you have modified
to taste, run this with one of these options:
  "grunt" alone creates a new, completed images directory
  "grunt clean" removes the images directory
  "grunt responsive_images" re-processes images without removing the old ones
*/

module.exports = function(grunt) {

  grunt.initConfig({
    responsive_images: {
      dev: {
        options: {
          engine: 'im',
          sizes: [
	  {
            suffix: "",
	    width: 200,
            quality: 100
	  },{
            suffix: "",
	    width: 400,
            quality: 100
	  },{
            suffix: "",
	    width: 600,
            quality: 100
	  },{
            suffix: "",
	    width: 800,
            quality: 100
	  },{
            suffix: "",
	    width: 1000,
            quality: 100
	  },{
            suffix: "",
	    width: 1200,
            quality: 100
	  },{
            suffix: "",
	    width: 1400,
            quality: 100
	  }]
        },

        files: [{
          expand: true,
          src: ['*.{gif,jpg,png}'],
          cwd: 'images.original/',
          dest: 'images/'
        }]
      }
    },

    /* Clear out the images directory if it exists */
    clean: {
      dev: {
        src: ['images'],
      },
    },

    /* Generate the images directory if it is missing */
    mkdir: {
      dev: {
        options: {
          create: ['images']
        },
      },
    },

    /* Copy the "fixed" images that don't go through processing into the images/directory */
    copy: {
      dev: {
        files: [{
          expand: true,
          src: 'images_src/fixed/*.{gif,jpg,png}',
          dest: 'images/'
        }]
      },
    },
  });

  grunt.loadNpmTasks('grunt-responsive-images');
  grunt.loadNpmTasks('grunt-contrib-clean');
  grunt.loadNpmTasks('grunt-contrib-copy');
  grunt.loadNpmTasks('grunt-mkdir');
  grunt.registerTask('default', ['clean', 'mkdir', 'copy', 'responsive_images']);

};
