GetAccountData = function(business)
  return exports[Config.JobManagementScriptName]:GetAccount(business)
end

AddAccountMoney = function(business, amount)
  return exports[Config.JobManagementScriptName]:AddMoney(business, amount)
end

RemoveAccountMoney = function(business, amount)
  return exports[Config.JobManagementScriptName]:RemoveMoney(business, amount)
end

BankingTransaction = function(identifier, amount, tax)
  if Config.Banking.okokbanking then
    TriggerEvent('okokBanking:AddNewTransaction', "Government", "", getName(identifier), identifier, amount, tax.." Tax")
  elseif Config.Banking.other then
    -- Add event/export here.
  end
end