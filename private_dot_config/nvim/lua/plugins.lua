vim.cmd [[packadd packer.nvim]]

require('packer').reset()
require('packer').init()

use = require('packer').use

use ('wbthomason/packer.nvim')
use ('nvim-lua/plenary.nvim')
