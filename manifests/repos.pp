# repos class
class ood::repos (
  $ood_web_repo_enabled      = 1 ,
  $ood_web_repo_gpgcheck     = 1 ,
  $ood_web_repo_gpgkey       = 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-ondemand',
  $ood_web_repo_proxy        = 'absent',
  $ood_web_repo_proxy_usr    = 'absent',
  $ood_web_repo_proxy_pas    = 'absent',
  $ood_web_repo_src_baseurl  = 'https://yum.osc.edu/ondemand/1.3/web/el7/SRPMS/',
  $ood_web_repo_src_enabled  = 0 ,
  $ood_web_repo_src_gpgcheck = 1 ,
  $ood_web_repo_src_gpgkey   = 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-ondemand',
){
  case $::osfamily {
    'RedHat': {
      case $ood_web_repo_baseurl = $::lsbmajdistrelease ? {
        6 => 'https://yum.osc.edu/ondemand/1.3/web/el6/$basearch/',
        7 => 'https://yum.osc.edu/ondemand/1.3/web/el7/$basearch/'
      }
      case $ood_web_repo_src_baseurl = = $::lsbmajdistrelease ? {
        6 => 'https://yum.osc.edu/ondemand/1.3/web/el6/SRPMS/',
        7 => 'https://yum.osc.edu/ondemand/1.3/web/el7/SRPMS/'
      }
      yumrepo { 'ondemand-web':
        baseurl        => $ood_web_repo_baseurl,
        enabled        => $ood_web_repo_enabled, 
        gpgcheck       => $ood_web_repo_gpgcheck,
        gpgkey         => $ood_web_repo_gpgkey,
        proxy          => $ood_web_repo_proxy,
        proxy_username => $ood_web_repo_proxy_usr,
        proxy_password => $ood_web_repo_proxy_pas
      }
      yumrepo { 'ondemand-web-source':
        baseurl        => $ood_web_repo_src_baseurl,
        enabled        => $ood_web_repo_src_enabled, 
        gpgcheck       => $ood_web_repo_src_gpgcheck,
        gpgkey         => $ood_web_repo_src_gpgkey,
        proxy          => $ood_web_repo_proxy,
        proxy_username => $ood_web_repo_proxy_usr,
        proxy_password => $ood_web_repo_proxy_pas
      }
    }
    default: {
      fail("Unsupported osfamily: ${::osfamily} operatingsystem: ${::operatingsystem}, module ${module_name} only supports osfamily RedHat el6 or el7")
    }
  } 
}