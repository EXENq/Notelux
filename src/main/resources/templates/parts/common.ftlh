<#macro page>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>Notelux</title>
    <link rel="stylesheet" href="/static/style.css" />
    <link rel="apple-touch-icon" href="/static/icon/android-icon-192x192.png" />
    <link rel="manifest" href="/static/manifest.json" />

    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="theme-color" content="#0074d9"/>
    <meta name="description" content="Just chatting!" />

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous" />
    <script src="https://www.google.com/recaptcha/api.js"></script>
    <script src="https://kit.fontawesome.com/7a7ec5c6c9.js" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.slim.min.js" integrity="sha256-u7e5khyithlIdTpu22PHhENmPcRdFiHRjhAuHcs05RI=" crossorigin="anonymous"></script>
</head>
<body>
    <#include "navbar.ftlh">
    <div class="container mt-5">
        <#nested>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"></script>

    <script>
    if ("serviceWorker" in navigator) {
        self.addEventListener("load", async () => {
            const container = navigator.serviceWorker;
            if (container.controller === null) {
                const reg = await container.register('/sw.js', {scope: '/'});

            }
        });
    }
</script>

</body>
</html>
</#macro>