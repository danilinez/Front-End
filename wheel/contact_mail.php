<?php 
session_start();
//include('SMTPmail/SMTPconfig.php');

if(isset($_POST['contact']))
{
      	//include ("Mail.php"); 
	$email=$_POST['email'];
	$subject = "Wheel- Contact Details";
	$msg  = "User Details,<br/>
		<table>
			<tr>
				<td>Name </td>
				<td>".$_POST['name']."</td>
			</tr>
			<tr>
				<td>Email </td>
				<td>".$_POST['email']."</td>
			</tr>
			<tr>
				<td>Contact No. </td>
				<td>".$_POST['phone']."</td>
			</tr>			
			<tr>
				<td>Message </td>
				<td>".$_POST['message']."</td>
			</tr>
		</table>";


$host = "5.9.192.204"; 
$username = "info@wheelhc.com"; 
$password = "faheem@123";  

require 'PHPMailer/PHPMailerAutoload.php';

$mail = new PHPMailer;

//$mail->SMTPDebug = 3;                               // Enable verbose debug output

$mail->isSMTP();                                      // Set mailer to use SMTP
$mail->Host = $host ;  // Specify main and backup SMTP servers
$mail->SMTPAuth = true;                               // Enable SMTP authentication
$mail->Username = $username;                 // SMTP username
$mail->Password = $password;                           // SMTP password
//$mail->SMTPSecure = 'ssl';                            // Enable TLS encryption, `ssl` also accepted
$mail->Port = 25;                                    // TCP port to connect to

$mail->From = 'info@wheelhc.com';
$mail->FromName = 'Wheelhc';
//$mail->addAddress('joe@example.net', 'Joe User');     // Add a recipient
$mail->addAddress('info@wheelhc.com');               // Name is optional
//$mail->addReplyTo($email, 'Information');
$mail->addCC('wheelhc1@gmail.com');
//$mail->addBCC('bcc@example.com');

//$mail->addAttachment('/var/tmp/file.tar.gz');         // Add attachments
//$mail->addAttachment('/tmp/image.jpg', 'new.jpg');    // Optional name
$mail->isHTML(true);                                  // Set email format to HTML

$mail->Subject = $subject;
$mail->Body    = $msg;
$mail->AltBody = 'This is the body in plain text for non-HTML mail clients';

if(!$mail->send()) {
    $rec= 2;
} else {
    $rec=1;
}


}
echo $rec;
?>