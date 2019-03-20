# -*- coding: utf-8 -*-

import json
import requests

# 云片文档api
# https://www.yunpian.com/doc/zh_CN/domestic/single_send.html
class YunPian(object):
    def __init__(self, apikey):
        self.apikey = apikey
        self.single_send_url = 'https://sms.yunpian.com/v2/sms/single_send.json'

    def send_sms(self, code, mobile):
        params = {
            "apikey": self.apikey,
            "mobile": mobile,
            "text": "【朱彬彬】您的验证码是{code}".format(code=code)
        }
        response = requests.post(self.single_send_url, data=params)
        res_dict = json.loads(response.text)
        return res_dict
        # {'code': 0, 'msg': '发送成功', 'count': 1, 'fee': 0.05, 'unit': 'RMB', 'mobile': '66666', 'sid': 24684038374}

if __name__ == '__main__':
    yunpian = YunPian('e1d64698ec8306cbbef73a914ba3d8ee')  # ee11
    # print(yunpian.send_sms("666666", "66666666"))