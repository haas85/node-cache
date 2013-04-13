module.exports = (grunt) ->
  grunt.initConfig
    pkg: grunt.file.readJSON "package.json"

    src:
      file: 'ncache'

    resources:
      src: ['src/<%= src.file %>.coffee']
      test: ['test/*.coffee']
      banner: '/* <%= pkg.name %> v<%= pkg.version %> - <%= grunt.template.today("yyyy/mm/dd") %>\n' +
              '<%= pkg.description %> - <%= pkg.homepage %>\n' +
              'Copyright (c) <%= grunt.template.today("yyyy") %> <%= pkg.author.name %>(<%= pkg.author.nickname %>)' +
              ' - Under <%= pkg.license %> License */\n'

    coffee:
      src:
        files:
          'build/<%= src.file %>.js': '<%= resources.src %>'
          'build/<%= src.file %>Test.js': '<%= resources.test %>'

    uglify:
      options:
        compress: false
        banner: '<%= resources.banner %>'
      package:
        files: 'package/<%=src.file%>.js': 'build/<%= src.file %>.js'

    jasmine:
        pivotal:
          src: 'package/<%= src.file %>.js'
          options:
            specs: 'build/<%= src.file %>Test.js',

    watch:
      src:
        files: ['<%= resources.src %>', '<%= resources.test %>']
        tasks: ['coffee', 'uglify', 'jasmine']

  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-contrib-uglify'
  grunt.loadNpmTasks 'grunt-contrib-jasmine'

  grunt.registerTask 'default', ['coffee', 'uglify', 'jasmine']
