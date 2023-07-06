local build_image = import '../util/build_image.jsonnet';
local pipelines = import '../util/pipelines.jsonnet';

[
  pipelines.linux('make cli/test') {
    trigger: {
      event: ['pull_request'],
    },
    steps: [{
      name: 'make cli/test',
      image: build_image.linux,
      commands: [
        'git submodule update --init --recursive',
        'make cli/test',
      ],
    }],
  },
]
