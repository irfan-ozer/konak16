<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>Bildirim</title>
	<meta http-equiv="Content-Language" content="tr" />
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	
	<style type="text/css">
		a {color: #36f; text-decoration: none; outline: 0;}
		table {font: 12px/20px Verdana, sans-serif;}
		td {padding: 0 2px;}
		.label {font-weight: bold; width: 100px;}
	</style>
</head>		
<body>
	<center>
	<table cellspacing="0" cellpadding="0" width="600" style="text-align: left; color: #444; border: 1px solid #ddd;">
		<tr>
			<td style="padding: 50px;">
				
				<h1 style="font-size: 20px; color: #000; border-bottom: 1px dotted #ccc; margin-bottom: 10px; padding-bottom: 10px; font-weight: normal;">
					İletişim Formu Bildirimi<br>
					<span style="font-size: 11px; padding-top: 3px;"><a href="<?php echo base_url() ?>"><?php echo base_url() ?></a></span>
				</h1>
				<table cellspacing="0" cellpadding="0" style="width: 100%;">
					<tr>
						<td class="label">İsim</td>
						<td width="20">:</td>
						<td><?php echo htmlspecialchars($fullname) ?></td>
					</tr>
					<tr>
						<td class="label">E-mail</td>
						<td width="20">:</td>
						<td><a href="mailto:<?php echo htmlspecialchars($email) ?>"><?php echo htmlspecialchars($email) ?></a></td>
					</tr>
					<tr>
						<td class="label">Telefon</td>
						<td width="20">:</td>
						<td><?php echo htmlspecialchars($phone) ?></td>
					</tr>
					<tr>
						<td class="label">Tarih</td>
						<td width="20">:</td>
						<td><?php echo $this->date->set($date)->datetimeWithName() ?></td>
					</tr>
					<tr>
						<td class="label">IP</td>
						<td width="20">:</td>
						<td><?php echo $ip ?></td>
					</tr>
				</table>
				
				<br /><br />

				<h1 style="font-size: 20px; color: #000; border-bottom: 1px dotted #ccc; text-align: left; margin-bottom: 10px; padding-bottom: 10px; font-weight: normal;">Mesaj</h1>
				<div style="line-height: 20px;"><?php echo nl2br(htmlspecialchars($comment)) ?></div>
				
				<br /><br />

				<table cellspacing="0" cellpadding="0">
					<tr>
						<td style="padding: 10px; line-height: 100%; background-color: #4CAE4C;">
							<a style="color: #fff;" href="<?php echo base_url('admin') ?>">Yönetim Paneli</a>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
	</center>
	
</body>
</html>