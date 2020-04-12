# vimrc

## 使用方法

### 克隆代码
```shell
git clone https://github.com/tengwu/vimrc ~/.vim
```

### 更新插件
直接clone下来的.vim插件不能更新，如果要更新，步骤如下
1. 删除~/.vim/Bundle/\*
```shell
rm -rf ~/.vim/Bundle/\*
```
2. 更新Vundle.vim，从github克隆新的Vundle.vim
```shell
git clone https://github.com/VundleVim/Vundle.vim ~/.vim/bundle/Vundle.vim
```

3. 安装其它插件
```shell
> # 打开vim
> # 普通模式下输入:PluginInstall
```
### TODO
使用vim-plug管理插件
