<?php

/**
 *
 * @param type $pdo
 * @return type
 */

function selectAll(PDO $pdo) {
    $liste = array();
    try {
        $lcnx = new PDO('mysql:host=localhost:8889;dbname=reservation','root', 'root');
        $lcnx->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        $lcnx->setAttribute(PDO::ATTR_AUTOCOMMIT, FALSE);
        $lcnx->exec("SET NAMES 'UTF8'");
        $sql = 'SELECT * FROM reservation.hotel';
        $lrs = $pdo->query($sql);
        $lrs->setFetchMode(PDO::FETCH_ASSOC);
        while ($enr = $lrs->fetch()) {
            $liste[] = $enr;
        }
    } catch (PDOException $e) {
        $enr = array();
        $enr[] = $e->getMessage();
        $liste[] = $enr;
    }
    return $liste;
}

function seDeconnecter(PDO &$pcnx) {
    $pcnx = null;
}

?>