/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   executer.c                                         :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: tsekiguc <tsekiguc@student.42tokyo.jp>     +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/01/25 16:19:58 by tsekiguc          #+#    #+#             */
/*   Updated: 2022/02/02 16:03:53 by tsekiguc         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "minishell.h"

void	executer(t_list *cmds)
{
	pid_t	ret;
	t_list	*last;
	int		cmd_count;
	t_cmd	*first;
	int		name;

	cmd_count = ms_lstsize(cmds);
	first = cmds->content;
	name = is_builtin(first->cmd->content);
	if (cmd_count == 1 && name != NO_BUILTIN)
	{
		do_exec(first);
	}
	else
	{
		last = ms_lstlast(cmds);
		ret = fork();
		if (ret == 0)
			do_pipe(last);
		else
			wait(NULL);
	}
}
