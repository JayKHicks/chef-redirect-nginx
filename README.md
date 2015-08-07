# chef-redirect-nginx-cookbook

This Cookbook is to Wrap the default NGINX cookbook and make needed attribute changes specific to the Redirect project

## Supported Platforms

CENTOS 6.6

## Attributes

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['chef-redirect-nginx']['bacon']</tt></td>
    <td>Boolean</td>
    <td>whether to include bacon</td>
    <td><tt>true</tt></td>
  </tr>
</table>

## Usage

### chef-redirect-nginx::default

Include `chef-redirect-nginx` in your node's `run_list`:

```json
{
  "run_list": [
    "recipe[chef-redirect-nginx::default]"
  ]
}
```

## License and Authors

Author:: JHICKS
