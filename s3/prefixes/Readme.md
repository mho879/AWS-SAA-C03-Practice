## Create bucket
```sh
aws s3 mb s3://prefixes-fun-mho
```

## Create folder
```sh
aws s3api put-object --bucket prefixes-fun-mho --key hello/
```

## Create many folders up to the max 1024 bytes
```sh
aws s3api put-object --bucket prefixes-fun-mho --key Lorem/ipsum/dolor/sit/amet,/consectetur/adipiscing/elit./Fusce/mollis/odio/ac/libero/faucibus,/eu/interdum/metus/sodales./Praesent/turpis/nisi,/venenatis/sit/amet/orci/a,/egestas/pulvinar/sem./Aenean/eleifend/sapien/vel/nulla/imperdiet/lacinia./Nulla/gravida/rutrum/placerat./Vivamus/fermentum/finibus/nibh,/eu/condimentum/nulla/tincidunt/non./Nam/imperdiet/interdum/ligula/ac/lobortis./Vestibulum/nec/auctor/enim./Vestibulum/ante/ipsum/primis/in/faucibus/orci/luctus/et/ultrices/posuere/cubilia/curae/Nam/quis/gravida/purus./Ut/vitae/tempor/lacus./Quisque/egestas/elit/lacinia,/fringilla/nisi/vel,/hendrerit/felis/Morbi/volutpat/varius/ligula,/id/interdum/ipsum/imperdiet/et./Ut/condimentum/volutpat/nisl,/at/convallis/libero/finibus/eget./Sed/consequat/odio/varius/augue/dapibus/euismod./Nam/sollicitudin/massa/a/nisl/congue,/a/maximus/felis/lacinia./Vivamus/condimentum/felis/in/nibh/aliquet/tristique/eget/nec/elit./Duis
```

## Try and break the 1024 byte limit
```sh
aws s3api put-object --bucket prefixes-fun-mho --key Lorem/ipsum/dolor/sit/amet,/consectetur/adipiscing/elit./Fusce/mollis/odio/ac/libero/faucibus,/eu/interdum/metus/sodales./Praesent/turpis/nisi,/venenatis/sit/amet/orci/a,/egestas/pulvinar/sem./Aenean/eleifend/sapien/vel/nulla/imperdiet/lacinia./Nulla/gravida/rutrum/placerat./Vivamus/fermentum/finibus/nibh,/eu/condimentum/nulla/tincidunt/non./Nam/imperdiet/interdum/ligula/ac/lobortis./Vestibulum/nec/auctor/enim./Vestibulum/ante/ipsum/primis/in/faucibus/orci/luctus/et/ultrices/posuere/cubilia/curae/Nam/quis/gravida/purus./Ut/vitae/tempor/lacus./Quisque/egestas/elit/lacinia,/fringilla/nisi/vel,/hendrerit/felis/Morbi/volutpat/varius/ligula,/id/interdum/ipsum/imperdiet/et./Ut/condimentum/volutpat/nisl,/at/convallis/libero/finibus/eget./Sed/consequat/odio/varius/augue/dapibus/euismod./Nam/sollicitudin/massa/a/nisl/congue,/a/maximus/felis/lacinia./Vivamus/condimentum/felis/in/nibh/aliquet/tristique/eget/nec/elit./Duis/test/if/this/works/1/2/3/4/5/6/7/8/9/0/10/11/1/12/1212/312/312/31/23/123/123//432/4234/534/hello.txt --body hello.txt
```