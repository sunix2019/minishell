# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tsekiguc <tsekiguc@student.42tokyo.jp>     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/01/21 17:33:29 by tsekiguc          #+#    #+#              #
#    Updated: 2022/01/21 18:20:26 by tsekiguc         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

CC						=	gcc
CFLAGS					=	-Wall -Wextra -Werror
INCLUDE					=	-Ilibms
LIB						=	-lreadline -Llibms -lms
RM						=	rm -f

############ minishell #############
MINISHELL				=	minishell
SRCS					=	lexer.c\
							is_func.c\
							lexer_test.c

OBJS_DIR				=	./objs
OBJS					=	$(addprefix $(OBJS_DIR)/, $(SRCS:.c=.o))
#####################################


############ lexer test #############
LEXER_TEST				=	lexer_test
LEXER_TEST_SRCS			=	lexer.c\
							is_func.c\
							lexer_test.c

LEXER_TEST_OBJS			=	$(addprefix $(OBJS_DIR)/, $(LEXER_TEST_SRCS:.c=.o))
#####################################


############ parser test #############
PARSER_TEST				=	parser_test
PARSER_TEST_SRCS		=	lexer.c\
							is_func.c\
							parser.c\
							syntax_check.c\
							token_kind.c\
							parser_test.c

PARSER_TEST_OBJS		=	$(addprefix $(OBJS_DIR)/, $(PARSER_TEST_SRCS:.c=.o))
#####################################

.PHONY			:	all clean fclean re tclean tfclean

vpath %.h srcs
vpath %.c srcs

all				:	$(MINISHELL)

$(MINISHELL)	:	$(OBJS)
					$(CC) $(OBJS) $(CFLAGS) $(LIB) -o $@

$(LEXER_TEST)	:	$(LEXER_TEST_OBJS)
					$(CC) $(LEXER_TEST_OBJS) $(CFLAGS) $(LIB) -o $@

$(PARSER_TEST)	:	$(PARSER_TEST_OBJS)
					$(CC) $(PARSER_TEST_OBJS) $(CFLAGS) $(LIB) -o $@


$(OBJS_DIR)/%.o	:	%.c
					@[ -d $(OBJS_DIR) ]
					$(CC) $(CFLAGS) $(INCLUDE) -c $< -o $@

clean			:
					$(RM) $(OBJS)

fclean			:
					$(RM) $(OBJS) $(MINISHELL)

re				:	fclean all

tclean			:
					$(RM)\
					$(LEXER_TEST_OBJS)\
					$(PARSER_TEST_OBJS)

tfclean			:
					$(RM) $(LEXER_TEST_OBJS) $(LEXER_TEST) $(PARSER_TEST_OBJS) $(PARSER_TEST)


