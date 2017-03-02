# vision-roles

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

