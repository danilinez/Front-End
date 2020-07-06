<?php
 $headers  = "From: $from\r\n";
            $headers .= "Content-type:text/html\r\n"; 
            $to="subink.mgd@gmail.com";
            $subject = "Wheel- Contact Details";
            $body="hi";
            mail($to, $subject, $body, $headers);
?>