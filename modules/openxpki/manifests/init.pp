
class openxpki (
  $local_path                              = '/opt/my_custom_filename.rb'
){

  $date_from_puppet_server = Timestamp.new()
  #Использование собственной функции $date_from_puppet_agent = openxpki::date_changer($facts['ssl_pki']['test2.corp.magneto.com']['ssl_date'][1])
  $date_from_puppet_agent = Timestamp.new($facts['ssl_pki']['test2.corp.magneto.com']['ssl_date'][1])

  notify { 'resource title1':
    message  => "На сервере время ${$date_from_puppet_server} тип данных ${type($date_from_puppet_server)}"
  }

  notify { 'resource title2':
    message  => "На агенте вермя  ${$date_from_puppet_agent} тип данных ${type($date_from_puppet_agent)}"
  }

  $date_result = ($date_from_puppet_agent - $date_from_puppet_server).strftime('%D')

  notify { 'resource title3':
    message  => "Разница в днях ${$date_result.to_i} тип данных ${type($date_result.to_i)}"
  }
  # if $facts['ssl_pki']['test2.corp.magneto.com']['ssl_date'][1] == '2023-11-10T11:10:52Z' {
  #
  #   notify { 'resource title2':
  #     message  => "Работает ${$facts['ssl_pki']['test2.corp.magneto.com']['ssl_date'][1]}"
  #   }
  #
  # }

  # openxpki { 'test':
  #   ensure => present,
  #   path   => $local_path, # Указание пользовательского имени файла
  # }

}




