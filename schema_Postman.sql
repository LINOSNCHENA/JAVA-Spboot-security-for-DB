
use presly; select *  from users, authorities;

{
	"userName":"root1",
	"password":"root1",
	"roles":"ROLE_ADMIN"
}

{
	"userName":"root2",
	"password":"root2",
	"roles":"ROLE_USER"
}

{
	"userName":"root3",
	"password":"root3",
	"roles":"ROLE_USER"
}

http://localhost:8081/register?userName=rootx1&password=Monze2019@&roles=ROLE_ADMIN