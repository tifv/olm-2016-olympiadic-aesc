import datetime

from jeolm.driver.regular import RegularDriver

GROUP_PREFIXES = ('approaching-', 'outrunning-')

class Driver(RegularDriver):

    def _select_outname(self, target, metarecord, date=None):
        outname = super()._select_outname_stem(target, metarecord)
        for group_prefix in GROUP_PREFIXES:
            if outname.startswith(group_prefix):
                outname = outname[len(group_prefix):]
                break
        else:
            group_prefix = None
        if isinstance(date, datetime.date):
            outname = date.isoformat() + '-' + outname
        if group_prefix is not None:
            outname = group_prefix + outname
        return outname

