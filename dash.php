<?php

    function remove_install() {
        shell_exec("rm -r install");
    }

    function dump() {
        shell_exec("mysqldump -u root hesk > /public_html/data/dump.sql && cp /public_html/hesk_settings.inc.php /public_html/data");
    }

    function restore() {
        shell_exec("mysql -u root hesk < /public_html/data/dump.sql && rm -r install && cp /public_html/data/hesk_settings.inc.php /public_html");
    }

    if (isset($_GET['rminstall'])) {
        remove_install();
    } elseif (isset($_GET['dump'])) {
        dump();
    } elseif (isset($_GET['restore'])) {
        restore();
    }
?>

<style>
    body {
        display:flex;
        align-items:center;
        flex-direction:column;
    }
    a {
        padding:2rem;
        width:10rem;
        text-align:center;
        margin:1rem;
        border:1px solid gray;
        color:black;
        text-decoration: none;
    }
</style>

<!-- The following anchors will provide a streamlined way for the end user to execute the required commands without needing technical knowledge -->

<a href="?dump=true">Dump Database</a>
<a href="?rminstall=true">Remove Install Dir</a>
<a href="?restore=true">Restore Database</a>
<a href="/admin/admin_main.php" target="_blank">Admin</a>