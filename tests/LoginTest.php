<?php declare(strict_types=1);
use PHPUnit\Framework\TestCase;

final class LoginTest extends TestCase
{
   
    public function testUsuarioPuedeLogearse(): void
    {
        $this->assertEquals(
            true,
            Login::logearse('admin','admin')
        );
    }
}
final class Login
{
   

    public function logearse($usuario,$password)
    {
        

        return($usuario=="admin" & $password=="admin");
    }

  
}
