#include "minishell.h"

void	put_error_exit(char *name, int status, char *msg, t_boolean is_exit)
{
	ms_putstr_fd("minishell", STDERR);
	if (msg == NULL)
	{
		perror(name);
	}
	else
	{
		if (name != NULL)
		{
			ms_putstr_fd(": ", STDERR);
			ms_putstr_fd(name, STDERR);
		}
		ms_putstr_fd(": ", STDERR);
		ms_putendl_fd(msg, STDERR);
	}
	if (is_exit == TRUE)
		exit(status);
}
