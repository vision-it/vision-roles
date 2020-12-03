# vision-roles

[![Build Status](https://travis-ci.com/vision-it/vision-roles.svg?branch=production)](https://travis-ci.com/vision-it/vision-roles)

Contains all roles, assigning each role a certain set of profiles. See: https://puppet.com/docs/pe/2018.1/the_roles_and_profiles_method.html

## Usage

Include in the *Puppetfile*:

```
mod vision_roles:
    :git => 'https://github.com/vision-it/vision-roles.git,
    :ref => 'production'
```

Include

```puppet
contain ::vision_roles::<ROLE>
```

