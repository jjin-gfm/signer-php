# WePay Signer for PHP

[![Source](http://img.shields.io/badge/source-wepay/signer–php-blue.svg?style=flat-square)](https://github.com/wepay/signer-php)
[![Latest Stable Version](http://img.shields.io/packagist/v/wepay/signer.svg?style=flat-square)](https://packagist.org/packages/wepay/signer)
[![Total Downloads](http://img.shields.io/packagist/dt/wepay/signer.svg?style=flat-square)](https://packagist.org/packages/wepay/signer)
[![Open Issues](http://img.shields.io/github/issues/wepay/signer-php.svg?style=flat-square)](https://github.com/wepay/signer-php/issues)
[![Build Status](http://img.shields.io/travis/wepay/signer-php/master.svg?style=flat-square)](https://travis-ci.org/wepay/signer-php)
[![Coverage Status](http://img.shields.io/coveralls/wepay/signer-php/master.svg?style=flat-square)](https://coveralls.io/r/wepay/signer-php?branch=master)
[![Code Climate](http://img.shields.io/codeclimate/github/wepay/signer-php.svg?style=flat-square)](https://codeclimate.com/github/wepay/signer-php)
[![Code Quality](http://img.shields.io/scrutinizer/g/wepay/signer-php.svg?style=flat-square)](https://scrutinizer-ci.com/g/wepay/signer-php)
[![Dependency Status](https://www.versioneye.com/user/projects/54dc5ab6c1bbbd9bd700050e/badge.svg?style=flat-square)](https://www.versioneye.com/user/projects/54dc5ab6c1bbbd9bd700050e)
[![SensioLabsInsight](https://insight.sensiolabs.com/projects/0bd1cdc9-be1b-445c-9fdc-358a57874ee2/mini.png)](https://insight.sensiolabs.com/projects/0bd1cdc9-be1b-445c-9fdc-358a57874ee2)
[![HHVM Support](http://img.shields.io/hhvm/wepay/signer-php.svg?style=flat-square)](https://hhvm.com)
[![Documentation Status](https://readthedocs.org/projects/wepay-signer-php/badge/?version=master&style=flat-square)](http://wepay-signer-php.readthedocs.org)
[![License](http://img.shields.io/packagist/l/wepay/signer-blue.svg?style=flat-square)](https://packagist.org/packages/wepay/signer)
[![Author](http://img.shields.io/badge/author-@skyzyx-blue.svg?style=flat-square)](https://twitter.com/skyzyx)

This is a thin wrapper around the [skyzyx/signer](https://github.com/skyzyx/signer) package.

This project uses [Semantic Versioning](http://semver.org) for managing backwards-compatibility.


## Examples
### Generate a signature
```php
use WePay\Signer\Signer;

$client_id = 'your_client_id';
$client_secret = 'your_client_secret';

$signer = new Signer($client_id, $client_secret);
$signature = $signer->sign([
    'page'         => $wepay_page_to_visit,
    'redirect_uri' => $partner_page_to_return_to,
]);

$signature = wordwrap($signature, 64, "\n", true);
#=> dfbffab5b6f7156402da8147886bba3eba67bd5baf2e780ba9d39e8437db7c47
#=> 35e9a0b834aa21ac76f98da8c52a2a0cd1b0192d0f0df5c98e3848b1b2e1a037
```

### Generate all of the query string parameters for the request
```php
$querystring = $signer->generateQueryStringParams([
    'page'         => $wepay_page_to_visit,
    'redirect_uri' => $partner_page_to_return_to,
]);

#=> client_id=your_client_id&
#=> page=https://wepay.com/account/12345&
#=> redirect_uri=https://partnersite.com/home&
#=> token=dfbffab5b6f7156402da8147886bba3eba67bd5baf2e780ba9d39e8437db7c47...
```


## Installation

Using [Composer]:
```bash
composer require wepay/signer-php=^1.0
```

And include it in your scripts:

```php
require_once 'vendor/autoload.php';
```


## Testing

Firstly, run `composer install --optimize-autoloader` to download and install the dependencies.

You can run the tests as follows:
```bash
bin/phpunit
```


## API Reference

The API Reference is generated by a tool called [Sami](http://phpdoc.org). You should install it locally
on your system with:

Once it's installed, you can generate updated documentation by running the following command in the root of the
repository.
```bash
bin/sami.php update docs/sami-config.php -v
```


## Contributing
Here's the process for contributing:

1. Fork WePay Signer for PHP to your GitHub account.
2. Clone your GitHub copy of the repository into your local workspace.
3. Write code, fix bugs, and add tests with 100% code coverage.
4. Commit your changes to your local workspace and push them up to your GitHub copy.
5. You submit a GitHub pull request with a description of what the change is.
6. The contribution is reviewed. Maybe there will be some banter back-and-forth in the comments.
7. If all goes well, your pull request will be accepted and your changes are merged in.


## Authors, Copyright & Licensing

* Copyright (c) 2015 [WePay](http://wepay.com).

See also the list of [contributors](/wepay/signer-php/contributors) who participated in this project.

Licensed for use under the terms of the [Apache 2.0] license.

  [PHP]: http://php.net
  [Composer]: https://getcomposer.org
  [MIT]: http://www.opensource.org/licenses/mit-license.php
  [Apache 2.0]: http://opensource.org/licenses/Apache-2.0


## Coding Standards

PSR-0/1/2 are a solid foundation, but are not an entire coding style by themselves. I have taken the time to document all of the nitpicky patterns and nuances of my personal coding style. It goes well-beyond brace placement and tabs vs. spaces to cover topics such as docblock annotations, ternary operations and which variation of English to use. It aims for thoroughness and pedanticism over hoping that we can all get along.

<https://github.com/skyzyx/php-coding-standards>

  [PHP]: http://php.net
  [Composer]: https://getcomposer.org
  [MIT]: http://www.opensource.org/licenses/mit-license.php
  [Apache 2.0]: http://opensource.org/licenses/Apache-2.0
