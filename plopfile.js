export default function (plop) {

  plop.setHelper('copyrightYear', function () {
    return new Date().getFullYear();
  });

  plop.setHelper('underline', function (char, length) {
    return char.repeat(length);
  });

  plop.setHelper('titlecase', function (text) {
    return text.charAt(0).toUpperCase() + text.slice(1);
  });

  plop.setHelper('uppercase', function (text) {
    return text.toUpperCase();
  });

  plop.setHelper('prefixConst', function (text) {
    return text.toUpperCase().replace(/\s+/g, '').replace(/[^A-Z]/g, '_');
  });

  const prompts = [
    {
      type: 'input',
      name: 'project_id',
      message: 'Project ID'
    },
    {
      type: 'input',
      name: 'project_name',
      message: 'Project Name'
    },
    {
      type: 'input',
      name: 'project_desc',
      message: 'Project Description '
    },
    {
      type: 'input',
      name: 'author_name',
      message: 'Author Name'
    },
    {
      type: 'input',
      name: 'author_email',
      message: 'Author Email'
    },
    {
      type: 'input',
      name: 'author_url',
      message: 'Author URL'
    },
    {
      type: 'input',
      name: 'github_id',
      message: 'GitHub ID'
    },
    {
      type: 'input',
      name: 'github_repo',
      message: 'GitHub Repository'
    },
    {
      type: 'input',
      name: 'github_token_prefix',
      message: 'GitHub Actions token prefix'
    }
  ];

  plop.setGenerator('project-site', {
    description: 'ProjectSite Plop',
    prompts: prompts,
    actions: [
      {
        type: 'addMany',
        destination: 'stage',
        templateFiles: [
          'templates/project-site/.*/*/*/*',
          'templates/project-site/.*/*/*',
          'templates/project-site/**/.*',
          'templates/project-site/**/*'
        ]
      }
    ]
  });

  plop.setGenerator('project-site-partials', {
    description: 'ProjectSite partials plop',
    prompts: prompts,
    actions: [
      {
        type: 'addMany',
        destination: 'stage/project-site-partials',
        templateFiles: [
          'templates/project-site-partials/*'
        ],
        base: 'templates/project-site-partials'
      }
    ]
  });

  plop.setGenerator('doco-site', {
    description: 'DocoSite Plop',
    prompts: prompts,
    actions: [
      {
        type: 'addMany',
        destination: 'stage',
        templateFiles: [
          'templates/doco-site/.*/*/*/*',
          'templates/doco-site/.*/*/*',
          'templates/doco-site/**/.*',
          'templates/doco-site/**/*'
        ]
      }
    ]
  });

  plop.setGenerator('doco-site-partials', {
    description: 'DocoSite partials plop',
    prompts: prompts,
    actions: [
      {
        type: 'addMany',
        destination: 'stage/doco-site-partials',
        templateFiles: [
          'templates/doco-site-partials/*'
        ],
        base: 'templates/doco-site-partials'
      }
    ]
  });
};