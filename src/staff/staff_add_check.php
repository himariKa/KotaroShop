<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>ろくまる農園</title>
    </head>
    <body>
        <?php 

        $staff_name=$_POST['name'];
        $staff_pass=$_POST['pass'];
        $staff_pass2=$_POST['pass2'];
        var_dump($staff_name);

        $staff_name=htmlspecialchars($staff_name,ENT_QUOTES,'UTF-8');
        $staff_pass=htmlspecialchars($staff_pass,ENT_QUOTES,'UTF-8');
        $staff_pass2=htmlspecialchars($staff_pass2,ENT_QUOTES,'UTF-8');

        //　スタッフ名が入力されているかチェック
        if($staff_name=='')
        {
            print'スタッフ名が入力されていません。<br>';
        }
        else
        {
            print'スタッフ名：';
            print $staff_name;
            print'<br>';
        }
        var_dump($staff_name);

        // 一つ目のパスワードが入力されているかチェック
        if($staff_pass=='')
        {
            print'パスワードが入力されていません。<br>';
        }

        // 二つ目のパスワードと同じかチェック
        if($staff_pass!=$staff_pass2)
        {
            print'パスワードが一致しません。<br>';
        }

        // 戻るボタン
        if($staff_name==''||$staff_pass==''||$staff_pass!=$staff_pass2)
        {
            print'<form>';
            print'<input type="button" onclick="history.back()" value="戻る">';
            print'</form>';
        }
        else
        {
            $staff_pass=md5($staff_pass);
            print'<form method="post" action="staff_add_done.php">';
            print'<input type="hidden" name="name" value="'.$staff_name.'">';
            print'<input type="hidden" name="pass" value="'.$staff_pass.'">';
            print'<br>';
            print'<input type="button" onclick="history.back()" value="戻る">';
            print'<input type="submit" value="OK">';
            print'</form>';

        }
        ?>
    </body>
</html>