
--
-- Database: `chat`
--

-- --------------------------------------------------------

--
-- Table structure for table `chatrooms`
--


-- Create `chatrooms` for Group Chat
CREATE TABLE `chatrooms` (
  `id` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `msg` varchar(200) NOT NULL,
  `created_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `chat_user_table`
--

CREATE TABLE `chat_user_table` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(250) NOT NULL,
  `user_email` varchar(250) NOT NULL,
  `user_password` varchar(100) NOT NULL,
  `user_profile` varchar(100) NOT NULL,
  `user_status` enum('Disabled','Enable') NOT NULL,
  `user_created_on` datetime NOT NULL,
  `user_verification_code` varchar(100) NOT NULL COMMENT "Registration Verification Code sent to the user's email",
  `user_login_status` enum('Logout','Login') NOT NULL,
  `user_token` VARCHAR(100) NULLL COMMENT 'A random unique string we generate with every login to be used in conjunction with `user_connection_id` to implement One-to-One Private Chat',
  `user_connection_id` INT(5) NULL COMMENT 'Unique Connection ID generated by the WebSocket Connection for every connected client (used in conjuntion with `user_token` column to implement One-to-One Private Chat)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE utf8mb4_general_ci;



-- Create `chat_message` for Private Chat
CREATE TABLE IF NOT EXISTS `chat_message` (
  `chat_message_id` INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `to_user_id` INT NOT NULL,
  `from_user_id` INT NOT NULL,
  `chat_message` MEDIUMTEXT NOT NULL,
  `timestamp` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` ENUM('Yes', 'No') NOT NULL COMMENT 'Chat Message is either \'Read\' or \'Unread\''
) COLLATE utf8mb4_bin;



-- Create `chat_message` for Private Chat
-- CREATE TABLE `chat_message` (
--   `chat_message_id` INT NOT NULL AUTO_INCREMENT ,
--   `to_user_id` INT NOT NULL ,
--   `from_user_id` INT NOT NULL ,
--   `chat_message` MEDIUMTEXT NOT NULL ,
--   `timestamp` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
--   `status` ENUM('Yes','No') NOT NULL COMMENT 'Chat Message is either \'Read\' or \'Unread\'',
--   PRIMARY KEY (`chat_message_id`)
-- ) ENGINE = InnoDB CHARSET=utf8mb4 COLLATE utf8mb4_bin;



--
-- Indexes for dumped tables
--

--
-- Indexes for table `chatrooms`
--
ALTER TABLE `chatrooms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chat_user_table`
--
ALTER TABLE `chat_user_table`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `chatrooms`
--
ALTER TABLE `chatrooms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `chat_user_table`
--
ALTER TABLE `chat_user_table`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

