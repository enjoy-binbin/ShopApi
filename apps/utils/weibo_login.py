

import requests
# 微博登陆接口的实现
# http://open.weibo.com/apps


def get_auth_url():
    # authorize文档: http://open.weibo.com/wiki/Oauth2/authorize
    weibo_auth_url = 'https://api.weibo.com/oauth2/authorize'
    redirect_url = 'http://119.29.27.194:8005/'
    auth_url = weibo_auth_url + '?client_id={client_id}&redirect_uri={re_url}'.format(client_id=3623674980, re_url=redirect_url)

    print(auth_url)


def get_access_token(code):
    # 文档: http://open.weibo.com/wiki/Oauth2/access_token
    access_token_url = 'https://api.weibo.com/oauth2/access_token'
    data = {
        'client_id': '3623674980',
        'client_secret': 'caa8d5c10201fb9477e8d6f00bd22f08',
        'grant_type': 'authorization_code',
        'code': code,
        'redirect_uri': 'http://119.29.27.194:8005/'
    }
    re_dirt = requests.post(access_token_url, data=data)
    # {'access_token': '2.00Y8_tNEe5ZOxD2214ec7441stksNE', 'remind_in': '157679999', 'expires_in': 157679999, 'uid': '3869806480', 'isRealName': 'true'}
    # print(re_dirt.json()['access_token'])


def get_user_info(access_token, uid):
    #　http://open.weibo.com/wiki/2/users/show
    user_url = 'https://api.weibo.com/2/users/show.json?access_token={token}&uid={uid}'.format(token=access_token,uid=uid)
    print(user_url)


if __name__ == '__main__':
    get_auth_url()
    get_access_token(code='a6519217e7aaaa8de57108600987e3e7')
    get_user_info(access_token='2.00Y8_tNEe5ZOxD2214ec7441stksNE', uid='3869806480')