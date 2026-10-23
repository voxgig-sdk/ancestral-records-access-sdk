
import { test, describe } from 'node:test'
import { equal } from 'node:assert'


import { AncestralRecordsAccessSDK } from '..'


describe('exists', async () => {

  test('test-mode', () => {
    const testsdk = AncestralRecordsAccessSDK.test()
    equal(testsdk instanceof AncestralRecordsAccessSDK, true,
      'AncestralRecordsAccessSDK.test() must return a client synchronously')
  })

})
