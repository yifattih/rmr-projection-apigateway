# 1.0.0 (2025-04-20)


### Bug Fixes

* **ci:** update lint and format jobs with new configurations directory ([06e1c62](https://github.com/yifattih/rmr-projection-apigateway/commit/06e1c6226da736f1509997c146467694ae30f212))
* **cors:** add conditional CORS support for all endpoints and pre-flight request support on OPTIONS requests ([28a8dd6](https://github.com/yifattih/rmr-projection-apigateway/commit/28a8dd65f14626d0aed628e4b379fdcc2db43568))
* **server:** add nginx servers template to allow environment variables in the configuration ([669d236](https://github.com/yifattih/rmr-projection-apigateway/commit/669d2369216d1261f14b1c0cc7976e1fdf35dc18))
* **service:** add api-auth.conf.template in config_modules directory to set authorization header with dynamic token injection using envsubs ([fc5ce04](https://github.com/yifattih/rmr-projection-apigateway/commit/fc5ce044bb7b8eb7d0d9a571861844f3ec4ca170))
* **service:** add bash script to get identity token to authenticate requests made to the API and UI services ([f92d349](https://github.com/yifattih/rmr-projection-apigateway/commit/f92d3491362f50522a46b255a5ab90f49a6a2edb))
* **service:** add Dockerfile for service container ([2c48988](https://github.com/yifattih/rmr-projection-apigateway/commit/2c48988ce93a136d8452015cb4ddba9ab4653076))
* **service:** add headers to pass information about the client IP address and protocol to the backend application ([79939b3](https://github.com/yifattih/rmr-projection-apigateway/commit/79939b37d3dbf30e930a542d71e9a69cff687f02))
* **service:** add nginx main configuration file ([f44e487](https://github.com/yifattih/rmr-projection-apigateway/commit/f44e4873cf2152e35f978bceecfcd937c99350fa))
* **service:** add nginx module to group and orgainze common headers used on all location directives for readability and maintainance ([39352e0](https://github.com/yifattih/rmr-projection-apigateway/commit/39352e02653f86843cfd19fe3f1ec01d3b156f50))
* **service:** add nginx module to unify security headers for security vulnerabilities ([9e49bde](https://github.com/yifattih/rmr-projection-apigateway/commit/9e49bde1e6111f0a0fadb61c6140d1930c7701bb))
* **service:** add nginx modules and configuration files, actions workflows and general documentation ([a7e421e](https://github.com/yifattih/rmr-projection-apigateway/commit/a7e421ef675a4022ef002690eca4f20744da8986))
* **service:** add script to call the script that fetch identity tokens and updates the relevant nginx config ([d32722e](https://github.com/yifattih/rmr-projection-apigateway/commit/d32722e83fafdf04a36ad789def917cd0e49ef96))
* **service:** add script to start cron and schedule token updates job ([3e2bd21](https://github.com/yifattih/rmr-projection-apigateway/commit/3e2bd216ed00e9d462d2b4cd94f27f10e86d4c30))
* **service:** add security headers to prevent common attacks ([a05bc06](https://github.com/yifattih/rmr-projection-apigateway/commit/a05bc06be32c494dc52d3bf69695dcfd9727ecdc))
* **service:** add servers.conf.template for server configuration using injected environment variables and including other specialized modules created ([3e86216](https://github.com/yifattih/rmr-projection-apigateway/commit/3e862169eafe2a50aeb0e375908ef007257a3fd7))
* **service:** add ui-auth.conf.template in config_modules directory to set authorization header with dynamic token injection using envsubs ([4670636](https://github.com/yifattih/rmr-projection-apigateway/commit/4670636b2ac9f00dc30ebc9ed515e137a55c3e5d))
* **service:** move main nginx.conf to config_modules to improve maintainability and add map variable to set allowed methods dynamically ([233c6ca](https://github.com/yifattih/rmr-projection-apigateway/commit/233c6cafdb45e56875176af1414f483f3d8dc54c))
* **service:** update env vars names for consistency with other project services ([#3](https://github.com/yifattih/rmr-projection-apigateway/issues/3)) ([381d287](https://github.com/yifattih/rmr-projection-apigateway/commit/381d287cace92edd1b8f2f2dba32c7a7dc48311a))
* **service:** update env vars names in nginx configuration files and dockerfile to be consistent with the rest of the project ([#4](https://github.com/yifattih/rmr-projection-apigateway/issues/4)) ([ec645d1](https://github.com/yifattih/rmr-projection-apigateway/commit/ec645d11ebb6992e1ae69d2114fc260c63a1a58d))
